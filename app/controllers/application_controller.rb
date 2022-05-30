# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # These 2 lines should be removed once the applications goes live
  before_action :set_default_url_options
  skip_before_action :verify_authenticity_token

  def set_default_url_options
    ActionMailer::Base.default_url_options = { host: request.host_with_port }
  end

  def after_sign_in_path_for(_resource)
    root_url
  end

  # ==========================
  # Modified Borda Count Algorithm
  # by Klyde Moradeyo
  # ==========================
  # input: Candidate Matrix
  # Takes in array that contains [ [<option_id>, <results received from voters>], [...], [...] ]
  def modified_borda_count(candidate_matrix)
    x = candidate_matrix.size + 1
    candidate_sum = 0
    candidate_result_matrix = create_result_matrix_borda_count(candidate_matrix, x)
    candidate_matrix.each_with_index do |candidate, index|
      candidate.each_with_index do |item, i|
        next unless i == 1

        item.each do |result|
          candidate_sum += x - result
        end
      end
      candidate_result_matrix[index][1] = candidate_sum
      candidate_sum = 0
    end
    candidate_result_matrix.sort_by(&:last).reverse
  end

  def create_result_matrix_borda_count(candidate_matrix, value)
    candidate_matrix_size = candidate_matrix.size
    array = Array.new(candidate_matrix_size) { [nil, value] }
    array.each_with_index.map do |arr, index|
      candidate_matrix.each_with_index do |c, i|
        if index == i
          arr[0] = c[0]
        end
      end
    end
    array
  end
  # ==========================
  # Modified Borda Count Algorithm END
  # ==========================

  # ==========================
  # D'Hondt Algorithm
  # by Klyde Moradeyo
  # ==========================
  # input: Candidate Matrix
  # Takes in array that contains [ [<option_id>, <results received from voters>], [...], [...] ]
  #
  # input: seats
  # Number of seats to be assigned
  def dhondt(candidate_matrix, seats)
    candidate_seat_matrix = create_result_matrix_dhondt(candidate_matrix)
    puts candidate_matrix.inspect
    # tally the results
    candidate_result_matrix = tally_dhondt_results(candidate_matrix)

    # Assign Seats
    if !candidate_matrix
      (1..seats).each do |_a|
        winner, val = candidate_result_matrix.max_by(&:last)
        to_find = candidate_seat_matrix.select { |(x, _y)| x == winner }
        winner_index = to_find.filter_map { |i| candidate_seat_matrix.find_index(i) }.min
        candidate_seat_matrix[winner_index][1] = candidate_seat_matrix[winner_index][1] + 1
        quot = val / (candidate_seat_matrix[winner_index][1] + 1)
        candidate_result_matrix[winner_index][1] = quot
        puts { "round: #{a} | winner: #{winner} | val: #{val} | quotient_value: #{quot}" }
      end
    end
    candidate_seat_matrix.sort_by(&:last).reverse
  end

  def tally_dhondt_results(candidate_matrix)
    candidate_sum = 0
    candidate_result_matrix = create_result_matrix_dhondt(candidate_matrix)
    candidate_matrix.each_with_index do |candidate, index|
      candidate.each_with_index do |item, i|
        next unless i == 1

        item.each do |result|
          candidate_sum += result
        end
      end
      candidate_result_matrix[index][1] = candidate_sum * 100 # multiply by 100 because algorithm wasn't built for a small amount of voters
      candidate_sum = 0
    end
    candidate_result_matrix
  end

  def create_result_matrix_dhondt(candidate_matrix)
    candidate_matrix_size = candidate_matrix.size
    array = Array.new(candidate_matrix_size) { [nil, 0] }
    array.each_with_index.map do |arr, index|
      candidate_matrix.each_with_index do |c, i|
        if index == i
          arr[0] = c[0]
        end
      end
    end
    array
  end
  # ==========================
  # D'Hondt Algorithm END
  # ==========================

  # ==========================
  # Create Candidate matrix
  # ==========================
  def calculate_results(ballot, qst)
    candidate_matrix = []
    case ballot.voting_type
    when "D'Hondt"
      voters = ballot.voters.pluck(:id)
      option_map = qst.question_results.pluck(:option_id, :voter_id).group_by(&:shift).transform_values(&:flatten)
      option_map.each do |key, value|
        arr = []
        out = voters.map { |voter_id| value.include?(voter_id) ? 1 : 0 }
        arr.push key
        arr.push out
        candidate_matrix.push arr
      end
      dhondt(candidate_matrix, @ballot.seats)
    when "Normal"
      qst.question_results.group(:option_id).count
    when "Modified Borda count"
      ballot.questions.each do |qst_b|
        candidate_matrix = []
        options_count = qst_b.options.count
        qst_b.options.each do |option|
          rank = QuestionResultRank.where(option_id: option.id).map(&:rank)  # getting preference vote per option
          arr = []
          arr.push option.id
          arr.push rank
          rank.each do |key, value|
            arr1 = []
            (0..options_count - 1).each do |i|
              arr1[i] = i == key - 1 ? value : 0
            end
          end
          arr.push
          candidate_matrix.push arr
        end
      end
      modified_borda_count(candidate_matrix)
    end
  end

  def has_voter_voted(ballot, voter)
    ballot.question_results.voter_result(voter.id).present?
  end
end

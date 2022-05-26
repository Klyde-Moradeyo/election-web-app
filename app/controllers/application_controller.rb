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

    # tally the results
    candidate_result_matrix = tally_dhondt_results(candidate_matrix)

    # Assign Seats
    (1..seats).each do |a|
      winner, val = candidate_result_matrix.max_by(&:last)
      to_find = candidate_seat_matrix.select { |(x, _y)| x == winner }
      winner_index = to_find.filter_map { |i| candidate_seat_matrix.find_index(i) }.min

      candidate_seat_matrix[winner_index][1] = candidate_seat_matrix[winner_index][1] + 1
      quot = val / (candidate_seat_matrix[winner_index][1] + 1)
      candidate_result_matrix[winner_index][1] = quot
      # Rails.logger.debug { "round: #{a} | winner: #{winner} | val: #{val} | quotient_value: #{quot}" }
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
      candidate_result_matrix[index][1] = candidate_sum
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
end

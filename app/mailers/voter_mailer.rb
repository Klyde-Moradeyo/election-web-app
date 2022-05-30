class VoterMailer < ApplicationMailer
    def new_voter(voter)
        @voter = voter
        mail(to: voter.email, subject: 'E.S.A | New Voter Account')
    end
end

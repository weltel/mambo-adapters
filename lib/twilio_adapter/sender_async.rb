require "twilio_adapter/sender"

module TwilioAdapter
	class SenderAsync < Sender

		#
		def initialize(phone_number, &url_helper)
			super(phone_number)
			@url_helper = url_helper
		end

		#
		def send(message)
			Twilio::SMS.create(
				:to => message.phone_number,
				:from => self.phone_number,
				:body => message.body,
				:status_callback => self.url_helper(message)
			)
		end

	protected
		#
		attr_reader(:url_helper)
	end
end

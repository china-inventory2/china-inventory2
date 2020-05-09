
class AccountCreator

	def initialize(user_params, team_params)
		@name = user_params[:name]
		@employee_number = user_params[:employee_number]
		@line_id = user_params[:line_id]
		@email = user_params[:email]
		@address = user_params[:address]
		@phone_number = user_params[:phone_number]
		@password = user_params[:password]
		@password_confirmation = user_params[:password_confirmation]
		@team_name = team_params[:name]
	end

	def team_build
		Team.create(name: @team_name)
	end

	def user_build
		Team.last.users.create(name: @name,
													employee_number: @employee_number,
													email: @email, address: @address,
													phone_number: @phone_number,
													password: @password,
													password_confirmation: @password_confirmation,
													line_id: @line_id,
													owner_flg: true)
	end
end
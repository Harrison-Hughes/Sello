class AddSecurityQuestionAndAnswerToUsersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :security_question, :string
    add_column :users, :security_answer, :string
  end
end

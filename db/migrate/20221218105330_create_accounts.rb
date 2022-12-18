# frozen_string_literal: true

ROM::SQL.migration do
  up do
    run "CREATE EXTENSION citext"

    create_table :accounts do
      primary_key :id
      Integer :status, null: false, default: 1
      citext :email, null: false, index: { unique: true, where: { status: [1, 2] } }
      String :password_hash
    end

    create_table :account_verification_keys do
      foreign_key :id, :accounts, primary_key: true
      String :key, null: false
      DateTime :requested_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :email_last_sent, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end

  down do
    drop_table :account_verification_keys
    drop_table :accounts

    run "DROP EXTENSION citext"
  end
end

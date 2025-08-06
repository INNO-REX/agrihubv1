defmodule AgrihubV1.Repo.Migrations.CreateAgrihubSchema do
  use Ecto.Migration


  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    # USERS AND AUTHENTICATION
    create table(:users) do
      add :email, :citext, null: false
      add :hashed_password, :string, null: false
      add :confirmed_at, :utc_datetime
      add :name, :string
      add :role, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:users, [:email])

    create table(:users_tokens) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      add :sent_to, :string

      timestamps(type: :utc_datetime, updated_at: false)
    end

    create index(:users_tokens, [:user_id])
    create unique_index(:users_tokens, [:context, :token])

    # FARM MANAGEMENT
    create table(:farms) do
      add :name, :string
      add :location, :string
      add :owner_id, references(:users, on_delete: :delete_all)
      timestamps()
    end

    create table(:plots) do
      add :name, :string
      add :size_acres, :float
      add :farm_id, references(:farms, on_delete: :delete_all)
      timestamps()
    end

    create table(:plants) do
      add :name, :string
      add :species, :string
      add :plot_id, references(:plots, on_delete: :delete_all)
      add :planting_date, :date
      add :harvest_estimate, :date
      timestamps()
    end

    # LIVESTOCK MANAGEMENT
    create table(:livestock_types) do
      add :name, :string
      add :category, :string
      timestamps()
    end

    create table(:livestock) do
      add :tag_number, :string
      add :livestock_type_id, references(:livestock_types, on_delete: :nilify_all)
      add :farm_id, references(:farms, on_delete: :delete_all)
      add :birth_date, :date
      add :health_status, :string
      timestamps()
    end

    # DRONE DATA
    create table(:drone_missions) do
      add :title, :string
      add :description, :text
      add :farm_id, references(:farms, on_delete: :delete_all)
      add :mission_date, :date
      timestamps()
    end

    create table(:drone_images) do
      add :drone_mission_id, references(:drone_missions, on_delete: :delete_all)
      add :image_url, :string
      add :map_data, :map
      timestamps()
    end

    # GREEN E-COMMERCE
    create table(:products) do
      add :name, :string
      add :description, :text
      add :price, :decimal
      add :stock, :integer
      add :farm_id, references(:farms, on_delete: :delete_all)
      timestamps()
    end

    create table(:orders) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :status, :string
      add :total_price, :decimal
      timestamps()
    end

    create table(:order_items) do
      add :order_id, references(:orders, on_delete: :delete_all)
      add :product_id, references(:products, on_delete: :delete_all)
      add :quantity, :integer
      add :price, :decimal
      timestamps()
    end

    # TRANSPORTATION
    create table(:vehicles) do
      add :vehicle_number, :string
      add :driver_name, :string
      add :capacity_kg, :integer
      timestamps()
    end

    create table(:deliveries) do
      add :order_id, references(:orders, on_delete: :delete_all)
      add :vehicle_id, references(:vehicles, on_delete: :nilify_all)
      add :departure_time, :utc_datetime
      add :arrival_time, :utc_datetime
      add :status, :string
      timestamps()
    end

    # CONSULTANCY
    create table(:consultants) do
      add :name, :string
      add :email, :string
      add :specialty, :string
      timestamps()
    end

    create table(:consultant_services) do
      add :consultant_id, references(:consultants, on_delete: :delete_all)
      add :title, :string
      add :description, :text
      add :price, :decimal
      timestamps()
    end

    create table(:service_requests) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :consultant_service_id, references(:consultant_services, on_delete: :delete_all)
      add :status, :string
      add :requested_at, :utc_datetime
      timestamps()
    end
  end
end

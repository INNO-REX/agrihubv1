defmodule Agrihub.Database.Schema.DroneMission do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drone_missions" do
    field :name, :string
    field :description, :string
    field :status, :string
    field :farm_id, :integer

    has_many :images, AgriHub.DroneMissions.Image
    has_many :flight_data, AgriHub.DroneMissions.FlightData

    timestamps()
  end

  @doc false
  def changeset(drone_mission, attrs) do
    drone_mission
    |> cast(attrs, [:name, :description, :status, :farm_id])
    |> validate_required([:name, :status])
  end
end

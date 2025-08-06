defmodule Agrihub.Database.Context.Drone do

  import Ecto.Query, warn: false
  alias AgriHub.Repo
  alias Agrihub.Database.Schema.DroneMission
  alias AgriHub.DroneMissions.Image
  alias AgriHub.DroneMissions.FlightData

  @doc """
  Returns the list of missions.
  """
  def list_missions do
    Repo.all(DroneMission)
    |> Repo.preload([:images, :flight_data])
  end

  @doc """
  Returns missions filtered by farm.
  """
  def list_missions_by_farm(farm) do
    from(m in Mission, where: m.farm == ^farm)
    |> Repo.all()
    |> Repo.preload([:images, :flight_data])
  end

  @doc """
  Gets a single mission.
  """
  def get_mission!(id) do
    Repo.get!(DroneMission, id)
    |> Repo.preload([:images, :flight_data])
  end

  @doc """
  Creates a mission.
  """
  def create_mission(attrs \\ %{}) do
    %DroneMission{}
    |> DroneMission.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mission.
  """
  def update_mission(%DroneMission{} = mission, attrs) do
    mission
    |> DroneMission.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mission.
  """
  def delete_mission(%DroneMission{} = mission) do
    Repo.delete(mission)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mission changes.
  """
  def change_mission(%DroneMission{} = mission, attrs \\ %{}) do
    Mission.changeset(mission, attrs)
  end

  @doc """
  Returns list of available farms.
  """
  def list_farms do
    DroneMission
    |> select([m], m.farm)
    |> distinct(true)
    |> Repo.all()
  end
end

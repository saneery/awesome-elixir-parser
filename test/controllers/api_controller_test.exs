defmodule AwesomeElixir.ApiControllerTest do
  use AwesomeElixir.ConnCase

  test "GET /api/libraries", %{conn: conn} do
    conn = get conn, "/api/libraries"
    assert json_response(conn, 200) == %{"data" => []}
  end

  test "GET /api/libraries with params", %{conn: conn} do
    conn = get conn, "/api/libraries", %{min_stars: 600000}
    assert json_response(conn, 200) == %{"data" => []}
  end
end

require 'test_helper'

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokemons_index_url
    assert_response :success
  end

  test "should get upload" do
    get pokemons_upload_url
    assert_response :success
  end

  test "should get destroy_all" do
    get pokemons_destroy_all_url
    assert_response :success
  end

end

require "test_helper"

describe PetsController do
  it "must get index" do
    get pets_path
    must_respond_with :success
    expect(response.header['Content-Type']).must_include 'json'
  end

  it "will return all proper fields for a list of pets" do
    pet_fields = ["id", "name", "age", "owner", "species"].sort

    get pets_path

    #get the body of the response as an array or hash
    body = JSON.parse(response.body)

    #assert
    expect(body).must_be_instance_of Array

    body.each do |pet|
      expect(pet).must_be_instance_of Hash
      expect(pet.keys.sort). must_equal pet_fields
    end
  end

  it "returns empty array if no pets exist" do
    Pet.destroy_all

    get pets_path

    #get the body of the response as an array or hash
    body = JSON.parse(response.body)

    expect(body).must_be_instance_of Array
    expect(body.length).must_equal 0

  end
end

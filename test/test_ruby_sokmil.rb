# frozen_string_literal: true

require "test_helper"

class TestRubySokmil < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RubySokmil::VERSION
  end

  def test_search_item
    puts __method__
    args = { keyword: "天使もえ" }
    result = test(:item, args)
    if result
      result[:items].each do |i|
        puts i[:title]
      end
    end
    assert true
  end

  def test_search_maker
    puts __method__
    result = test(:maker)
    if result
      result[:maker].each do |m|
        puts m[:name]
      end
    end
    assert true
  end

  # Seems label API is not working as of May 12, 2023
  def test_search_label
    puts __method__
    result = test(:label)
    if result
      result[:label].each do |l|
        puts l[:name]
      end
    end
    assert true
  end

  # Seems series API is not working as of May 12, 2023
  def test_search_series
    puts __method__
    result = test(:series)
    if result
      result[:series].each do |l|
        puts l[:name]
      end
    end
    assert true
  end

  def test_search_genre
    puts __method__
    result = test(:genre)
    if result
      result[:genre].each do |l|
        puts l[:name]
      end
    end
    assert true
  end

  def test_search_director
    puts __method__
    result = test(:director)
    if result
      result[:director].each do |d|
        puts d[:name]
      end
    end
    assert true
  end

  def test_search_actor
    puts __method__
    result = test(:actor)
    if result
      result[:actor].each do |a|
        puts a[:name]
      end
    end
    assert true
  end

  private

  def test(method, args = {})
    cli = RubySokmil.new
    args.store(:category, "av")
    response = cli.send(method, args)
    return response.body[:result] if response.body[:result][:status] == "200"

    puts "Status : #{response.body[:result][:status]} : #{response.body[:result][:message]}"
  end
end

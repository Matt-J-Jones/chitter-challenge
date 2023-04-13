require 'user'
require 'user_repository'

RSpec.describe UserRepository do
  def reset_chitter_table
    seed_sql = File.read('spec/seeds.sql')
    connection = DatabaseConnection.connect('chitter_test')
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_chitter_table()
  end

  context 'User Managment' do
    it "adds user to database" do
      repo = UserRepository.new
      new_user = User.new('SofiaMoore', 'TigerStripedFox55@hotmail.com', 'wE8hN')
      expect(repo.create(new_user)).to eq true
    end

    it "finds and returns user by ID" do
      repo = UserRepository.new
      result = repo.find_by_id(2)
      expect(result.username).to eq 'EthanHernandez'
    end

    it "finds and returns user by email" do
      repo = UserRepository.new
      result = repo.find_by_email('NeonUnicorn12@yahoo.com')
      expect(result.username).to eq 'EthanHernandez'
    end

    it "finds and returns user by username" do
      repo = UserRepository.new
      result = repo.find_by_username('EthanHernandez')
      expect(result.email).to eq 'NeonUnicorn12@yahoo.com'
    end

    it "adds user to database, returns user" do
      repo = UserRepository.new
      new_user = User.new('SofiaMoore', 'TigerStripedFox55@hotmail.com', 'wE8hN')
      expect(repo.create(new_user)).to eq true

      result = repo.find_by_email('TigerStripedFox55@hotmail.com')
      expect(result.username).to eq 'SofiaMoore'
    end

    it "returns all users" do
      repo = UserRepository.new
      result = repo.all
      expect(result[0].username).to eq 'EmmaJohnson'
      expect(result[2].username).to eq 'DanielAnderson'
    end
  end
end

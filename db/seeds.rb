p "=== SEED ==="
require "csv"

5.times do |n|
  User.find_or_create_by!(
      name: "高専太郎#{n + 1}",
      id_name: "kosen_taro#{n + 1}",
      email: "test#{n + 1}@test.com") do |user|
    user.password = 'password'
    user.password_confirmation = 'password'
    user.save
  end
end

user = User.all

CSV.foreach('db/theme.csv') do |row|
  Who.create(
    user: user.sample,
    content: row[0]
  )

  Where.create(
    user: user.sample,
    content: row[1]
  )

  What.create(
    user: user.sample,
    content: row[2]
  )
end

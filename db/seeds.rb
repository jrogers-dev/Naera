User.create(email: "a@a.com", password: "passworda")
User.create(email: "b@b.com", password: "passwordb")
User.create(email: "c@c.com", password: "passwordc")
Day.create(date: Date.today, calories: 0, protein: 0, carbs: 0, fat: 0, user_id: User.find_by(email: "a@a.com").id)
Day.create(date: Date.today.prev_day, calories: 0, protein: 0, carbs: 0, fat: 0, user_id: User.find_by(email: "a@a.com").id)
Day.create(date: Date.today, calories: 0, protein: 0, carbs: 0, fat: 0, user_id: User.find_by(email: "b@b.com").id)
Day.create(date: Date.today.prev_day, calories: 0, protein: 0, carbs: 0, fat: 0, user_id: User.find_by(email: "b@b.com").id)
Day.create(date: Date.today, calories: 0, protein: 0, carbs: 0, fat: 0, user_id: User.find_by(email: "c@c.com").id)
Day.create(date: Date.today.prev_day, calories: 0, protein: 0, carbs: 0, fat: 0, user_id: User.find_by(email: "c@c.com").id)

Table users {
  id int [pk, increment]
  username varchar
  email varchar
  password_hash varchar
  created_at timestamp
}

Table characters {
  id int [pk, increment]
  user_id int [ref: > users.id]
  name varchar
  age int
  gender varchar
  alignment enum('good', 'bad', 'neutral')
  karma int
  created_at timestamp
}

Table regions {
  id int [pk, increment]
  name varchar
  population int
}

Table cities {
  id int [pk, increment]
  region_id int [ref: > regions.id]
  name varchar
  population int
}

Table economy {
  id int [pk, increment]
  city_id int [ref: > cities.id]
  gdp float
  inflation_rate float
  unemployment_rate float
}

Table education {
  id int [pk, increment]
  city_id int [ref: > cities.id]
  literacy_rate float
  school_accessibility float
}

Table infrastructure {
  id int [pk, increment]
  city_id int [ref: > cities.id]
  roads_quality int
  electricity_access float
  water_access float
}

Table events {
  id int [pk, increment]
  name varchar
  description text
  city_id int [ref: > cities.id]
  impact enum('positive', 'neutral', 'negative')
  created_at timestamp
}

Table decisions {
  id int [pk, increment]
  character_id int [ref: > characters.id]
  description text
  moral_choice enum('good', 'bad', 'neutral')
  outcome text
  created_at timestamp
}

Table karma_logs {
  id int [pk, increment]
  character_id int [ref: > characters.id]
  change int
  reason text
  created_at timestamp
}

Table items {
  id int [pk, increment]
  name varchar
  description text
  type enum('food', 'weapon', 'medicine', 'misc')
  value float
}

Table inventories {
  id int [pk, increment]
  character_id int [ref: > characters.id]
  item_id int [ref: > items.id]
  quantity int
}

Table messages {
  id int [pk, increment]
  sender_id int [ref: > characters.id]
  receiver_id int [ref: > characters.id]
  content text
  sent_at timestamp
}

Table governments {
  id int [pk, increment]
  region_id int [ref: > regions.id]
  leader_name varchar
  ideology enum('democracy', 'authoritarian', 'anarchy', 'mixed')
  term_ends timestamp
}

Table elections {
  id int [pk, increment]
  region_id int [ref: > regions.id]
  held_at timestamp
  winner_id int [ref: > characters.id]
}

Table laws {
  id int [pk, increment]
  name varchar
  description text
  created_by int [ref: > governments.id]
  enacted_at timestamp
}

Table crimes {
  id int [pk, increment]
  character_id int [ref: > characters.id]
  type enum('theft', 'murder', 'corruption', 'assault')
  description text
  committed_at timestamp
}

Table prisons {
  id int [pk, increment]
  name varchar
  city_id int [ref: > cities.id]
  capacity int
}

Table imprisonments {
  id int [pk, increment]
  character_id int [ref: > characters.id]
  prison_id int [ref: > prisons.id]
  crime_id int [ref: > crimes.id]
  sentence_years int
  start_date timestamp
}

Table jobs {
  id int [pk, increment]
  title varchar
  city_id int [ref: > cities.id]
  salary float
  requirements text
}

Table employment {
  id int [pk, increment]
  character_id int [ref: > characters.id]
  job_id int [ref: > jobs.id]
  started_at timestamp
  ended_at timestamp
}

Table health_logs {
  id int [pk, increment]
  character_id int [ref: > characters.id]
  status enum('healthy', 'sick', 'injured', 'dead')
  description text
  recorded_at timestamp
}

Table hospitals {
  id int [pk, increment]
  name varchar
  city_id int [ref: > cities.id]
  capacity int
}

Table diseases {
  id int [pk, increment]
  name varchar
  description text
  fatality_rate float
  spread_rate float
}


Ref: "crimes"."type" < "crimes"."id"

Ref: "imprisonments"."prison_id" < "imprisonments"."id"
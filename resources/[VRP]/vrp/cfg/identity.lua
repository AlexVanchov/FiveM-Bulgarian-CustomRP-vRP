local cfg = {}

-- city hall position
cfg.city_hall =	{1143.6135253906,-644.16052246094,56.851600646972}

-- cityhall blip {blipid,blipcolor}
cfg.blip = {498,4}

-- cost of a new identity
cfg.new_identity_cost = 50

-- phone format (max: 20 chars, use D for a random digit)
cfg.phone_format = "089DDDDDDD"
-- cfg.phone_format = "06DDDDDDDD" -- another example for cellphone in France


-- config the random name generation (first join identity)
-- (I know, it's a lot of names for a little feature)
-- (cf: http://names.mongabay.com/most_common_surnames.htm)
cfg.random_first_names = {
  "Смени",
  "Смени"
}

cfg.random_last_names = {
  "Ме",
  "Ме"
}

return cfg

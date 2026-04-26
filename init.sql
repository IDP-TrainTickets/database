CREATE TABLE IF NOT EXISTS app_user (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_type VARCHAR(20) DEFAULT 'Adult'
);

CREATE TABLE IF NOT EXISTS route (
    id SERIAL PRIMARY KEY,
    from_location TEXT NOT NULL,
    to_location TEXT NOT NULL,
    leave_at TIME NOT NULL,
    arrive_by TIME NOT NULL,
    price INT NOT NULL
);

CREATE TABLE IF NOT EXISTS trip (
    id SERIAL PRIMARY KEY,
    route_id INT NOT NULL REFERENCES route(id) ON DELETE CASCADE,
    trip_day DATE NOT NULL,
    capacity INT NOT NULL,

    UNIQUE (route_id, trip_day)
);

CREATE TABLE IF NOT EXISTS reservation (
    id SERIAL PRIMARY KEY,
    trip_id INT NOT NULL REFERENCES trip(id) ON DELETE CASCADE,
    user_id INT NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
);

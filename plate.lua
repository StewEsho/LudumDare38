local plate = {}

function plate:init(x, y)
	plate.x = x
	plate.y = y

	plate.body = love.physics.newBody(world, x, y, "dynamic")
	plate.shape = love.physics.newRectangleShape(0, 0, 200, 15)
	plate.fixture = love.physics.newFixture(plate.body, plate.shape, 2)
	plate.fixture:setCategory(2)
	plate.fixture:setFriction(0.9)
	plate.body:setGravityScale(1)
end

function plate:run()
	if(love.keyboard.isDown("q")) then
		plate.body:applyAngularImpulse(-400)
	elseif (love.keyboard.isDown("e")) then
		plate.body:applyAngularImpulse(400)
	end
end

function plate:draw()
	love.graphics.setColor(128, 128, 128, 255)
	love.graphics.polygon("fill", plate.body:getWorldPoints(plate.shape:getPoints()))
end

return plate;

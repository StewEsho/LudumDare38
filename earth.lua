local earth = {}

function earth:init(x, y)
	earth.x = x
	earth.y = y
	earth.sprite = love.graphics.newImage("art/earth.png")

	earth.body = love.physics.newBody(world, x, y, "dynamic")
	earth.shape = love.physics.newCircleShape(16)
	earth.fixture = love.physics.newFixture(earth.body, earth.shape, 1)
	earth.fixture:setFriction(1)
	earth.fixture:setCategory(2)
end

function earth:run()
	earth.x = earth.body:getX()
	earth.y = earth.body:getY()

	if (earth.y > 720) then --reset level
		-- love.load()
	end
end

function earth:draw()
	love.graphics.setColor(50, 200, 255, 255)
	love.graphics.draw(earth.sprite,
						earth.body:getX(),
						earth.body:getY(),
						earth.body:getAngle(),
						1,
						1,
						earth.sprite:getWidth()/2,
						earth.sprite:getHeight()/2)
	-- love.graphics.circle("fill", earth.body:getX(), earth.body:getY(), earth.shape:getRadius())
end

return earth;

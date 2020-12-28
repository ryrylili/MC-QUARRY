io.write("Zint:")
Zint=io.read()
io.write("Xint:")
Xint=io.read()
io.write("Zfin:")
Zfin=io.read()
io.write("Xfin:")
Xfin=io.read()

l = 0
i = 0
j = 0
k = 0

DIT = 0
gas = turtle.getFuelLevel()
item = 0

Z = Zint - Zfin
X = Xfin - Xint
Y = 0

function Down()
    if turtle.detectDown() then turtle.digDown() end
    turtle.down()
    if turtle.detectDown() then turtle.digDown() end
    turtle.down()
    if turtle.detectDown() then turtle.digDown() end
    turtle.down()
end

function Up()
    turtle.up()
    turtle.up()
    turtle.up()
end

function Column()
    for i = 1 , Z do
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.digDown()
    end
end

function Right()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()
    turtle.turnRight()
end


function Left()
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()
    turtle.turnLeft()
end


function HomeR()
    for k = 1 , Z do
        turtle.back()
    end
    turtle.turnRight()
    for k = 1 , Z do
        turtle.back()
    end
    turtle.turnLeft()
end

function HomeL()
    turtle.turnLeft()
    for k = 1 , Z do 
        turtle.back()
    end
    turtle.turnLeft()
end

function Dit()
    local block, type = turtle.inspectDown()
    if type.name == "minecraft:bedrock" then 
        DIT = 1
    end
end

function Gas()
    gas = turtle.getFuelLevel()
    if gas < (X*Z+X+Z+30) then 
        for l = 1 , Y do
            Up()
        end
        io.write("feed me coal:")
        io.read()
        turtle.refuel(all)
        gas = turtle.getFuelLevel()
        for l = 1 , Y do 
            Down()
        end
    end
end


function Items()
    turtle.select(16)
    item = turtle.getItemCount()
    if item > 0 then
        for l = 1 , Y do
            Up()
        end
        for l = 1 , 16 do
            turtle.select(l)
            turtle.dropUp()
        end 
        for l = 1 , Y do 
            Down()
        end
        item = 0
    end
    turtle.select(1) 
end


while not (DIT == 1) do
    Down()
    Y=Y+1
    for j = 1 , X+1 do
        Column()
        if j%2 == 1 then
            if j == X+1 then
                HomeR()
                Gas()
                Dit()
                Items()
            else
                Right()
            end
        else
            if j == X+1 then
                HomeL()
                Gas()
                Dit()
                Items()
            else
                Left()
            end
        end
    end
end
for l = 1 , Y do
    Up()
end
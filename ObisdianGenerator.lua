local count = 0
local running = false
function detectObsidian()
	turtle.select(16)
    turtle.dropUp(turtle.getItemCount()-1)
	if turtle.compare() then
		turtle.dig()
        count = count + 1
	else
		turtle.select(15)
        turtle.suckDown(64-turtle.getItemCount())
        if turtle.getItemCount() >=1 then
        	turtle.place()    
        else
            running = false
        end                
	end
end

function Idle()
    running = true
    term.clear()
    print("=======================================")
    print(" Good morning, Obsidian Quarry Running ")
    print("=======================================")
	while running do
		detectObsidian()
		sleep(1)
	end
    term.clear()
    print("=======================================")
    print("     Out of redstone, halting!")
    print("       Generated: "..count.." obsidian!")
    print("=======================================")
    
end

Idle()
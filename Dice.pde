void setup()
{
	noLoop();
	size(400,400);
	background(0,255,0);
	for(int y = 10;y<=310;y+=50){
		for(int x = 30;x<=330;x+=50){
			Die d = new Die(x,y);
			diceArray.add(d);
		}
	}	
}

int highest = 0;
ArrayList<Die> diceArray = new ArrayList<Die>();

void draw()
{
	background(0,255,0);
	for(int k = 0;k<diceArray.size();k++){
		diceArray.get(k).roll();
		diceArray.get(k).show();
	}
	showTotal();
}
void mousePressed()
{
	redraw();
}
void showTotal(){
	int total = 0;
	for(int p = 0;p<diceArray.size();p++)
		total+=diceArray.get(p).dots;
	fill(255,0,0);
	textSize(18);
	text("Total: "+total,30,370);
	if(total>highest)
		highest = total;
	text("Highest Total: "+highest,150,370);
}
class Die //models one single dice cube
{
	int dieX,dieY,dots;
	
	Die(int x, int y) //constructor
	{
		dieX = x;
		dieY = y;
		dots = (int)(Math.random()*6)+1;
	}
	void roll()
	{
		dots = (int)(Math.random()*6)+1;
	}
	void show()
	{
		fill(255);
		rect(dieX,dieY,40,40,3);
		fill(0);
		if(dots==1)
			ellipse(dieX+20,dieY+20,3,3);
		if(dots==2){
			ellipse(dieX+(40/6.0),dieY+(40/6.0),3,3);
			ellipse(dieX+40-(40/6.0),dieY+40-(40/6.0),3,3);
		}
		if(dots==3){
			ellipse(dieX+(40/6.0),dieY+(40/6.0),3,3);
			ellipse(dieX+40-(40/6.0),dieY+40-(40/6.0),3,3);
			ellipse(dieX+20,dieY+20,3,3);
		}
		if(dots==4){
			ellipse(dieX+(40/6.0),dieY+(40/6.0),3,3);
			ellipse(dieX+40-(40/6.0),dieY+40-(40/6.0),3,3);
			ellipse(dieX+40-(40/6.0),dieY+(40/6.0),3,3);
			ellipse(dieX+(40/6.0),dieY+40-(40/6.0),3,3);
		}
		if(dots==5){
			ellipse(dieX+(40/6.0),dieY+(40/6.0),3,3);
			ellipse(dieX+40-(40/6.0),dieY+40-(40/6.0),3,3);
			ellipse(dieX+40-(40/6.0),dieY+(40/6.0),3,3);
			ellipse(dieX+(40/6.0),dieY+40-(40/6.0),3,3);
			ellipse(dieX+20,dieY+20,3,3);
		}
		if(dots==6){
			ellipse(dieX+(40/6.0),dieY+(40/6.0),3,3);
			ellipse(dieX+40-(40/6.0),dieY+40-(40/6.0),3,3);
			ellipse(dieX+40-(40/6.0),dieY+(40/6.0),3,3);
			ellipse(dieX+(40/6.0),dieY+40-(40/6.0),3,3);
			ellipse(dieX+(40/6.0),dieY+20,3,3);
			ellipse(dieX+40-(40/6.0),dieY+20,3,3);
		}
	}
}

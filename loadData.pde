Table table;

ArrayList<String> state = new ArrayList<String>(); 

ArrayList<Integer> area = new ArrayList<Integer>(); 

int valgt = 0;

void setup(){
//thread ("udskrivState");
//thread ("udskrivArea");
//thread ("visualiser ");
table = loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv", "header");

size(1900, 1000);

udskrivState();
udskrivArea();

}

void draw(){
clear();

diagram();

}

void udskrivState(){
for(TableRow r: table.rows()){

String s = r.getString("state");

state.add(s);

println("state:" +s);

}}

void udskrivArea(){
for(TableRow r: table.rows()){

int s = r.getInt("area (sq. mi)");

area.add(s);

println("area (sq. mi):" +s);

}}

void diagram(){

for(int i = 0; i < 5; i++){  


text(state.get(valgt+i), 200+300*i, height-50);

rect(200+300*i , height-100, 200, -area.get(valgt+i)/800);
}

}

void mouseReleased(){
if(mouseButton==LEFT)
valgt++;
else valgt--;

if (valgt < 0)
valgt = (state.size()-5);
if (valgt > (state.size()-5))
valgt = 0;

}

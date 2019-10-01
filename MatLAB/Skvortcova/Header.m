%v gener otprav vhodnie dannie

[masy,masx] = Gener(-10,100,1,16,5) %funkciya dlya izobrazheniya grafika c shagom 1 i predelom ot -10 do 100
figure ('Name','Zadanie 1_2') %nazvanie grafika
plot(masx,masy) %plot - postroenie grafikov
axis([-10 100 -0.01 0.5]) %nastrojka osej

filterData = Filter(masy)%filtr znacheniy function
figure ('Name','Zadanie 1_3') %nazvanie grafika
plot(masx,filterData)
axis([-10 100 -1 60]) %nastrojka osej
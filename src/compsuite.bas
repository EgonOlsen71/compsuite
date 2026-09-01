10 poke 53280,0:poke 53281,0:poke 646,2
20 print chr$(147);chr$(14);:poke 646,1
30 print "Setting up...":gosub 60000
40 gosub 59000
50 print chr$(147);
60 print "     BASIC V2 - Compatibility Suite"
70 print "----------------------------------------"
80 poke 2,0:sys 51200:ok%=0
90 gosub 1000
100 gosub 1200:gosub 1300:gosub 1400:gosub 1500
105 gosub 1600:gosub 1700:gosub 1800:gosub 1900
110 gosub 2000:gosub 2100:gosub 2200:gosub 2300
115 gosub 2400:gosub 2500:gosub 2600:gosub 1100
180 print:if er%=0 then poke 646,7:print"All tests passed!"
185 if er%<>0 then poke 646,10:print er%"tests failed (of 17)!"
199 poke 2,0:wait 198,1:end
1000 rem check array init
1005 print "Array init with 0....";
1010 gosub 57000:for i=0 to 20
1020 if rs%(i)<>0 or rs(i)<>0 then er%=1
1030 next i
1040 if er%=1 then ok%=ok%+1
1050 for i=0 to 20:rs%(i)=0:rs(i)=0:next i
1060 gosub 58000
1070 return
1100 rem endless loop exit
1105 print "Exit endless loop....";
1110 gosub 57000:cn%=0:for x=0 to 1 step 0
1120 cn%=cn%+1:if cn%=50 then x=1
1130 next x
1140 if cn%<>50 then er%=1
1150 gosub 58000
1160 return
1200 rem integer overflow 1
1205 print "Integer overflow 1...";
1210 gosub 57000
1220 cn%=5000:a%=30000:b%=32000:tm=cn%+a%-b%
1230 if tm<>3000 then er%=1
1240 gosub 58000
1250 return
1300 rem integer overflow 2
1305 print "Integer overflow 2...";
1310 gosub 57000
1320 cn%=5000:a%=10:b%=32:tm=cn%*a%/b%
1330 if tm<>1562.5 then er%=1
1340 gosub 58000
1350 return
1400 rem integer overflow 3
1405 print "Integer overflow 3...";
1410 gosub 57000
1420 cn%=5000:a%=30000:b%=32000:tm%=cn%+a%-b%
1430 if tm%<>3000 then er%=1
1440 gosub 58000
1450 return
1500 rem integer overflow 4
1505 print "Integer overflow 4...";
1510 gosub 57000
1520 cn%=5000:a%=10:b%=32:tm%=cn%*a%/b%
1530 if tm%<>1562 then er%=1
1540 gosub 58000
1550 return
1600 rem rnd
1605 print "Random numbers.......";
1610 gosub 57000:tm=rnd(-7):tm=rnd(1)
1620 if abs(tm-0.451873339)>0.01 then er%=1
1630 gosub 58000
1640 return
1700 rem boolean 1
1705 print "Boolean 1............";
1706 gosub 57000:tm=5:rs(0)=tm>5
1710 t2=12.2:rs(1)=t2<=tm
1720 tm%=9:t2=67:rs(2)=tm%=t2
1730 t2=12.2:rs(3)=t2>=tm
1740 rs(4)=t2>tm%
1750 rs(5)=(t2>tm%)*11.23
1760 cm%=5:gosub 59500:gosub 58000
1770 return
1800 rem boolean 2
1805 print "Boolean 2............";
1810 gosub 57000:j=200:i=100:p=32000+int(j/8)*320+int(i/8)*8+(j and 7)
1820 poke p,245:poke p,peek(p) or (2^(7-(i and 7))):rs(0)=peek(p)
1840 tf%=2^(7-((i+1) and 7))
1850 poke p,107:poke p,peek(p) or (2^(7-(i and 7))) or tf%:rs(1)=peek(p)
1860 poke p,65:poke p,peek(p) or tf%:rs(2)=peek(p)
1870 cm%=2:gosub 59500:gosub 58000
1880 return
1900 rem for-loop 1
1902 print "FOR loop 1...........";:gosub 57000
1905 goto 1910
1906 next:if a=0 then 1985
1907 goto 1950
1908 next:goto 1950
1910 for i=0 to 10
1920 rs(i)=i
1930 goto 1980
1940 a=0:goto 1906
1950 for i=11 to 15
1960 rs(i)=i
1970 goto 1940
1980 a=1:on (i and 1)+1 goto 1906,1908
1985 cm%=15:gosub 59500:gosub 58000
1990 return
2000 rem for-loop 2
2005 print "FOR loop 2...........";:gosub 57000
2010 a=0:for i=0 to 5
2020 rs(i)=i:next
2030 if a=0 then a=1:for i=6 to 10
2040 if i=8 then 2020
2050 rs(i)=i:next
2060 cm%=10:gosub 59500:gosub 58000
2070 return
2100 rem for-loop 3
2105 print "FOR loop 3...........";:gosub 57000
2110 p=-1:for i=0 to 4
2120 rs(i)=i:goto 2150
2150 next:if i<6 then 2180
2160 if p=-1 then for p=11 to 12:rs(p)=p:goto 2150
2170 goto 2190
2180 for i=5 to 10:rs(i)=i:goto 2150
2190 cm%=12:gosub 59500:gosub 58000
2195 return
2200 rem for-loop 4
2205 print "FOR loop 4...........";:gosub 57000
2210 cn%=0:for p=-1 to 1
2220 for i=4 to 6:goto 2240
2230 rs(cn%)=p:cn%=cn%+1:rs(cn%)=i:cn%=cn%+1:next:goto 2260
2240 for i=9 to 11:rs(cn%)=i:cn%=cn%+1:next
2250 goto 2230
2260 cm%=14:gosub 59500:gosub 58000
2270 return
2300 rem for-loop 5
2305 print "FOR loop 5...........";:gosub 57000
2310 for i=1 to 5:rs(i-1)=i
2320 on i goto 2340,2350,2370,2360,2380
2330 goto 2390
2340 next
2350 next
2360 next
2370 next
2380 next
2390 cm%=4:gosub 59500:gosub 58000
2395 return
2400 rem for-loop 6
2405 print "FOR loop 6...........";:gosub 57000
2410 cn%=0:for i=0 to 2
2420 gosub 2450
2430 rs(cn%)=i:cn%=cn%+1:next:goto 2480
2450 for p=2 to 30
2460 rs(cn%)=p:cn%=cn%+1:if p=5 then return
2470 next
2480 cm%=14:gosub 59500:gosub 58000
2490 return
2500 rem 2D arrays
2505 print "2D arrays............";:gosub 57000
2510 dim a(5,5):cn%=0
2520 a(3,4)=42:a(2,3)=2
2530 p(2)=3:p(4)=2
2540 rs(cn%)=a(3,4):cn%=cn%+1
2545 rs(cn%)=a(p(2),4):cn%=cn%+1
2550 h=4:rs(cn%)=a(p(a(p(4),int(asc("!")/11))),h):cn%=cn%+1
2555 h=4:rs(cn%)=a(0+p(h-2),h):cn%=cn%+1
2560 h=p(2):rs(cn%)=a(h,4)
2570 cm%=4:gosub 59500:gosub 58000
2580 return
2600 rem data access
2605 print "DATA access..........";:gosub 57000
2606 for i=0 to 4:rs(i)=111111:next
2610 read rs(0),rs(1),rs(2),rs(3),rs(4)
2620 cm%=4:gosub 59500:gosub 58000
2630 return


57000 rem setup next test
57010 poke 2,1:er%=0:tm%=0:tm=0:t2=0:return
58000 rem print state
58010 poke 2,0:if er%=0 then poke 646,5:print "passed":poke 646,1:return
58020 poke 646,2:print "FAILED":poke 646,1:return
59000 dim rs%(20),rs(20):return
59500 rem check batch results (float)
59510 for i=0 to cm%:read rs:if rs<>rs(i) then er%=1
59520 rs(i)=0:next i:return
60000 for qq=51200 to 51304:read dq:poke qq,dq:next
60001 return
60002 data 120,173,20,3,201,44,208,7,173,21,3,201,200,240,27,173,20,3,141
60003 data 103,200,173,21,3,141,104,200,169,44,141,20,3,169,200,141,21,3
60004 data 169,0,141,102,200,88,96,72,138,72,152,72,165,2,240,36,238,102
60005 data 200,173,102,200,201,200,208,31,169,0,133,2,141,102,200,164,211
60006 data 169,4,145,209,200,169,14,145,209,200,169,6,145,209,76,94,200
60007 data 169,0,141,102,200,104,168,104,170,104,108,103,200,0,49,234

61000 rem results for Boolean 1
61001 data 0,0,0,-1,-1,-11.23
61005 rem results for Boolean 2
61006 data 253,111,69
61007 rem results for for-loop 1
61008 data 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
61009 rem results for for-loop 2
61010 data 0,1,2,3,4,5,6,7,8,9,10
61011 rem results for for-loop 3
61012 data 0,1,2,3,4,5,6,7,8,9,10,11,12
61013 rem results for for-loop 4
61014 data 9,10,11,-1,12,9,10,11,0,12,9,10,11,1,12
61015 rem results for for-loop 5
61016 data 1,2,3,4,5
61017 rem results for for-loop 6
61018 data 2,3,4,5,0,2,3,4,5,1,2,3,4,5,2
61019 rem results for 2D arrays
61020 data 42,42,42,42,42
61021 rem data and results for data access
61022 data 0,,.,e,
61023 data 0,0,0,0,0
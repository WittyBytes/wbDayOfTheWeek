//DAY OF THE WEEK////////////////////////////////////////
//© 2016 by Real Burger, Licensed under the MIT license//
string wbDayOfTheWeek() {
    list dateComponents = llParseString2List(llGetDate(), ["-"], []);
    integer y = (integer)llList2String(dateComponents, 0);
    integer m = (integer)llList2String(dateComponents, 1);
    integer d = (integer)llList2String(dateComponents, 2);
    list t = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];
    if (m < 3) {
        y --;
    }
    integer result = (y + y/4 - y/100 + y/400 + llList2Integer(t, m-1) + d) % 7;
    list dayNames = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"];
    return (llList2String(dayNames, result));
}
///////////////////////////////////////////////////////////
default {
    state_entry() {
        llSay(0, "Touch me please");
    }
    touch_start(integer total_number) {
        llSay(0, "Today is "+wbDayOfTheWeek());
    }
}
DECLARE
	X RATES.SSRate%type;
	Y RATES.MedRate%type;
	XY RATES.MaxSS%type;
    
    YR INCOME.YEAR%type;
	HS INCOME.HOURS%type;
	RT INCOME.RATE%type;
    
    counter NUMBER(10,2);
    
    incomeInfo INCOME%rowtype;
    cursor incomePtr is SELECT * INTO YR, HS, RT FROM INCOME;
BEGIN
    SELECT * 
    INTO X, Y, XY
    FROM RATES;

	DBMS_OUTPUT.PUT_LINE('Rates and Maximum SS tax: ' || X ||' '|| Y ||' '|| XY);
    DBMS_OUTPUT.PUT_LINE(' ');
    counter := 0;
    for incomeInfo in incomePtr
    loop
        if (((incomeInfo.Hours*incomeInfo.Rate)*X) >= 12600) THEN
        counter := (counter + (12600 +((incomeInfo.Hours*incomeInfo.Rate)*Y)));
        DBMS_OUTPUT.PUT_LINE(incomeInfo.YEAR || ' '
                        || (incomeInfo.Hours*incomeInfo.Rate) || ' ' 
                        ||('12600' || ' ')
                        ||((incomeInfo.Hours*incomeInfo.Rate)*Y) || ' '
                        || (((incomeInfo.Hours*incomeInfo.Rate)*X)+((incomeInfo.Hours*incomeInfo.Rate)*Y)) ||' MAXSS');
        else
            counter := (counter + (((incomeInfo.Hours*incomeInfo.Rate)*X)+((incomeInfo.Hours*incomeInfo.Rate)*Y)));
            DBMS_OUTPUT.PUT_LINE(incomeInfo.YEAR || ' '
                        || (incomeInfo.Hours*incomeInfo.Rate) || ' ' 
                        ||((incomeInfo.Hours*incomeInfo.Rate)*X) || ' '
                        ||((incomeInfo.Hours*incomeInfo.Rate)*Y) || ' '
                        || (((incomeInfo.Hours*incomeInfo.Rate)*X)+((incomeInfo.Hours*incomeInfo.Rate)*Y)));
        end if;
    end loop;
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('Total Self-Employment tax ' || counter);
    
end;
//type:c an event is triggered 
//at the same time as waiting
//for the event trigger


module event_eg03();
    event a;

    task process_A();
        $display("@%0t: Before triggering event a",$time);
        ->a;
        $display("@%0t: After triggering event a",$time);
    endtask

    task process_B();
        $display("@%0t: Waiting for the event a",$time);
        //@a;
        wait(a.triggerd);
        $display("@%0t: event a is triggered",$time);
    endtask

    initial begin 
        fork
            process_A();
            process_B();
        join
    end
    



//Output on 'EDA PLAYGROUND'
/*
___________________________________________
@0: Before triggering event a
@0: After triggering event a
@0: Waiting for the event a
@0: event a is triggered
___________________________________________
*/
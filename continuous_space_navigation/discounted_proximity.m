% for keep counting and global discounted proximity
function [p,step] = discounted_proximity(LTM, ltm_eidx, ltm_sidx, STM, o)
    p = 0;
    step = [0 0 0];
    global_discounted_proximity = 1;
    if LTM(ltm_sidx,1,ltm_eidx)==o
        step = LTM(ltm_sidx,1:3,ltm_eidx);
        p=1;
        ltm_sidx = ltm_sidx-1;
        [stm_sidx, ~] = size(STM);
        while ltm_sidx>0 && stm_sidx>0 
            global_discounted_proximity = global_discounted_proximity * 0.95;
                if LTM(ltm_sidx,1,ltm_eidx)==STM(stm_sidx,1) ... 
                && LTM(ltm_sidx,2,ltm_eidx)==STM(stm_sidx,2)
                    p = p + global_discounted_proximity;
                end
                
            ltm_sidx = ltm_sidx-1;
            stm_sidx = stm_sidx-1;
        end
    end
end

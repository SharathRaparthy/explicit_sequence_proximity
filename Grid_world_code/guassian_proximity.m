function [p,step] = guassian_proximity(LTM, ltm_eidx, ltm_sidx, STM, o)
p = 0;
step = [0 0 0];
global_discounted_proximity = 1;
if LTM(ltm_sidx,1,ltm_eidx)==o
    step = LTM(ltm_sidx,1:3,ltm_eidx);
    p=1;
    ltm_sidx = ltm_sidx-1;
    [stm_sidx, ~] = size(STM);
    l = size(LTM,1) + 1; 
    while ltm_sidx>0 && stm_sidx>0
        global_discounted_proximity = global_discounted_proximity * 0.95;
        local_discounted_proximity = 1;
        j=0;
        % for same step index of the compared LTM and STM 
        if ltm_sidx<l
        if LTM(ltm_sidx,1,ltm_eidx)==STM(stm_sidx,1) ...
                && LTM(ltm_sidx,2,ltm_eidx)==STM(stm_sidx,2)
            j = (local_discounted_proximity * global_discounted_proximity);
            l = ltm_sidx;
        end
        end
        i=1;
        while j==0 && ((ltm_sidx-i)>0 || (ltm_sidx+i)<l) 
            local_discounted_proximity = local_discounted_proximity * 0.8;
            % for LTM step indices of lower value than the LTM step index
            % compared with the STM index
            if (ltm_sidx-i)>0 && (ltm_sidx-i)<l
                if LTM((ltm_sidx-i),1,ltm_eidx)==STM(stm_sidx,1) ...
                        && LTM((ltm_sidx-i),2,ltm_eidx)==STM(stm_sidx,2)
                    j = (local_discounted_proximity * global_discounted_proximity);
                    l = (ltm_sidx-i);
                end
            end
            % for LTM step indices of higher value than the LTM step index
            % compared with the STM index
            if (ltm_sidx+i)<l
                if LTM((ltm_sidx+i),1,ltm_eidx)==STM(stm_sidx,1) ...
                        && LTM((ltm_sidx+i),2,ltm_eidx)==STM(stm_sidx,2)
                    j = (local_discounted_proximity * global_discounted_proximity);
                    l = (ltm_sidx+i);
                end
            end
            
            i=i+1;
        end
        
        p = p + j;
        
        ltm_sidx = ltm_sidx-1;
        stm_sidx = stm_sidx-1;
    end
end
end

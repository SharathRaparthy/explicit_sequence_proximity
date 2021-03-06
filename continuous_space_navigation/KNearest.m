function [nearest_steps total_p] = KNearest(LTM, STM, o)

    K = 8;
    
    nearest_steps = [];
    [ltm_steps_numof, ~, ltm_episodes_numof] = size(LTM);
    max_p = 0;
    total_p=0;
    for eidx = 1:ltm_episodes_numof
        for sidx = 1:ltm_steps_numof
            [p step] = mccallum_proximity(LTM, eidx, sidx, STM, o);
            if p>0
                [nearest_steps_numof, ~] = size(nearest_steps);
                if nearest_steps_numof < K
                    nearest_steps = [nearest_steps; step p];
                else
                    [minVal minIdx] = min(nearest_steps(:,4));
                    if p > minVal
                        nearest_steps(minIdx,:) = [step, p];
                    end
                end
            end
        end
    end
    if isempty(nearest_steps)
        total_p=0;
    else
        total_p = total_p + sum(nearest_steps(:,4));
    end
end

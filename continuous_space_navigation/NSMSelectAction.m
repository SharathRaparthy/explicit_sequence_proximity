function [action total_p max_p_action] = NSMSelectAction(LTM, STM, o)

 
 nearest_steps_action=[];

    EPSILON = 0.2;

    if rand()<EPSILON
        action = randi([1,3]);
        total_p=0;
        max_p_action=0;
    else
        action_means = zeros(3,1);
        action_counts = zeros(3,1);

        [nearest_steps total_p] = KNearest(LTM, STM, o);
        [nearest_steps_numof, ~] = size(nearest_steps);
        for sidx = 1:nearest_steps_numof
            step = nearest_steps(sidx,:);
            action = step(2);
            action_means(action) = action_means(action)*action_counts(action);
            action_means(action) = action_means(action)+step(3);
            action_counts(action) = action_counts(action)+1;
            action_means(action) = action_means(action)/action_counts(action);
        end
        max_mean = max(action_means);
        actions = find(action_means==max_mean);
        action = actions(randi([1,length(actions)]));
        
        %nearest steps of the winning action 
        i=1;
        while i<=nearest_steps_numof
              if nearest_steps(i,2)==action
                 nearest_steps_action = [nearest_steps_action; nearest_steps(i,4)];
              end
              i=i+1;
        end
    end
    
        if isempty(nearest_steps_action)
            max_p_action=0;
        else
        max_p_action = max(nearest_steps_action(:,1));
        end
end

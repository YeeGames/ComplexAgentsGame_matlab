function score = countScore( Pros, player)
%countScore �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

switch Pros.game
    case 'RandomFly'
        for i=1:Pros.numPlayers
            player(i).score=length(player(i).pos);
            score(i)=player(i).score;
        end
        % score=sort(score,'descend');
        % for i=1:Pros..numPlayers
        %     disp('number ',i,' is : ',player(i).colorName,'/t','score is : ',score);
        % end
        
    case 'Balance'
        for i=1:Pros.numPlayers
            
        end
        
    otherwise
        
end

end


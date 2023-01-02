function  [checkerboard,player,score,Pros] = RandomFly(checkerboard,player,Pros)
%RANDOMFLY �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��



%% layout
%% randomized average layout

temp010=(randperm(Pros.numOfPoints)).';
temp020=Pros.numOfPoints/Pros.numPlayers;
for i=1:Pros.numPlayers
    player(i).pos=[player(i).pos;temp010((i-1)*temp020+1:i*temp020)];
    chessboard.pos(player(i).pos)=player(i).id;
end
clear temp010 temp020;

%% visualization
[ chessboard,Pros ] = visualizeChessboard(chessboard,player,Pros );

%% playing
isContinueCriterions=1;
while isContinueCriterions>0;
    isContinueCriterions=1;
    
    % dicing to select players and position at checkboard
    attacker=randi([1,Pros.numPlayers]);
    attackPos = randi([1,Pros.sizeOfChessboard],1,2);
    attackPos=sub2ind([Pros.sizeOfChessboard Pros.sizeOfChessboard],attackPos(1),attackPos(2));
    
    % choose a player change its chessman
    defender=chessboard.pos(attackPos);
    indexOfDefenderPos=find(player(defender).pos==attackPos);
    player(defender).pos(indexOfDefenderPos)=[];
    player(attacker).pos(end+1)=attackPos;
    chessboard.pos(attackPos)=player(attacker).id;
    
    %% visualization
    [ chessboard,Pros ]  = visualizeChessboard(chessboard,player,Pros );
    %      [ chessboard,Pros ] = visualizeChessboardUpdate( player,attacker,attackPos,chessboard,Args,Pros );    pause(Pros.pauseTime);
    %%
    % stop criterions .game overed when one of a players has died.
    for i=1:Pros.numPlayers
        isContinueCriterions=isContinueCriterions.*sum(sum(player(i).pos));
    end
end

%% count sort and publisher
score = countScore( Pros, player);

%% end
% pause;












end


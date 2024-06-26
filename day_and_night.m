function Conway()
    board_size = 100;
    screen_board = zeros(board_size, board_size);
    screen_board = randi([0, 1], board_size, board_size);
    % Display initial grid
    imagesc(screen_board);
    colormap(flipud(gray)); % Invert grayscale colormap for black background
    axis equal;
    axis on;
    drawnow;

    generations = 1000; % Number of generations to simulate

    for gen = 1:generations
        screen2 = screen_board; % Create a copy to store the next state

        % Iterate over each cell in the grid
        for j = 1:board_size
            for k = 1:board_size
                % Count live neighbors (wrap-around using mod)
                nc = -screen_board(j, k);
                for dj = -1:1
                    for dk = -1:1
                        nc = nc + screen_board(mod(j-1+dj, board_size)+1, mod(k-1+dk, board_size)+1);
                    end
                end

                % Apply Conway's rules
                if screen_board(j, k) == 0
                    if nc == 3|| nc==6|| nc==7|| nc==8
                        screen2(j, k) = 1; % Cell is born if exactly three neighbors
                    end
                else
                    if nc==1 || nc==2 || nc==5
                        screen2(j, k) = 0; % Dies by underpopulation or overpopulation
                    end
                end
            end
        end

        screen_board = screen2; % Update the current state to the next state

        % Display the updated grid
        imagesc(screen_board);
        colormap(flipud(gray)); % Invert grayscale colormap for black background
        axis equal;
        axis on;
        drawnow;
    end
end


# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: digoncal <digoncal@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/19 11:01:17 by digoncal          #+#    #+#              #
#    Updated: 2023/03/05 16:18:44 by digoncal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS = -g -Wall -Wextra -Werror
MLXFLAGS = -L ./libs/minilibx -lm -lmlx -Ilmlx -lXext -lX11
DEPS = libs/minilibx/mlx.h libs/libft/libft.a

NAME = so_long
SRC = so_long.c map_check.c map_check_utils.c render.c render_utils.c move_player.c
OBJ = $(SRC:.c=.o)

LIBFT = libs/libft/libft.a

all: deps $(NAME)
	
deps:
	$(MAKE) -C ./libs/libft
	$(MAKE) -C ./libs/minilibx
	
$(NAME): $(OBJ) $(DEPS)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT) $(MLXFLAGS) -g -o $(NAME)

clean:
	$(MAKE) $@ -C ./libs/libft
	$(MAKE) $@ -C ./libs/minilibx
	@rm -rf $(OBJ)

fclean: clean
	$(MAKE) $@ -C ./libs/libft
	@rm -rf $(NAME)

re: fclean all
	$(MAKE) re -C ./libs/libft
	$(MAKE) re -C ./libs/minilibx

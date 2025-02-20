.data
    # Músicas
notas1:      .word 60, 60, 62, 60, 65, 64, 60, 60, 62, 60, 67, 65, 60, 60, 72, 69, 65, 64, 62, 70, 70, 69, 65, 67, 65  # Parabéns pra Você
duracoes1:   .word 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500

notas2:      .word 60, 60, 67, 67, 69, 69, 67, 65, 65, 64, 64, 62, 62, 60  # Brilha Brilha
duracoes2:   .word 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500

notas3:      .word 60, 62, 64, 65, 65, 65, 60, 62, 60, 62, 62, 62, 62, 67, 65, 64, 64, 64  # Do ré mi fá
duracoes3:   .word 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500

notas4:      .word 62, 64, 67, 67, 67, 67, 67, 67, 67, 62, 64, 67, 67, 67, 67, 67, 67, 67, 62, 64, 67, 67, 67, 67, 67, 67, 67, 67, 67, 66, 66, 62, 64, 67, 67, 67, 67, 67, 67, 67, 62, 64, 67, 67, 67, 67, 67, 67, 67, 62, 64, 67, 67, 67, 67, 67, 67, 67, 67, 67, 66  # Baby Shark
duracoes4:   .word 300, 300, 250, 250, 250, 250, 250, 250, 250, 300, 300, 250, 250, 250, 250, 250, 250, 250, 300, 300, 250, 250, 250, 250, 250, 300, 300, 300, 1000, 320, 320, 270, 270, 270, 270, 270, 270, 270, 320, 320, 270, 270, 270, 270, 270, 270, 270, 320, 320, 270, 270, 270, 270, 270, 320, 320, 320

notas5:      .word 65, 69, 72, 72, 72, 74, 72, 69, 65, 65, 69, 72, 72, 70, 69, 67, 72, 72, 72, 72, 72, 72, 72, 70, 69, 67, 62, 72, 72, 72, 65, 69, 72, 72, 72, 70, 69, 67, 65, 72, 72, 74, 72, 70, 70, 70, 70, 72, 70, 69, 69, 69, 70, 69, 72, 72, 72, 70, 69, 67, 72, 72, 74, 72, 70, 70, 70, 70, 72, 70, 69, 69, 69, 70, 69, 72, 72, 72, 70, 69, 67, 65  # Meu Pintinho Amarelinho
duracoes5:   .word 300, 300, 200, 200, 300, 200, 200, 200, 500, 300, 400, 300, 300, 200, 200, 500, 300, 300, 300, 800, 300, 400, 300, 300, 200, 200, 300, 200, 200, 200, 400, 300, 400, 300, 300, 200, 200, 400, 300, 300, 300, 300, 300, 400, 300, 300, 200, 200, 300, 200, 200, 200, 400, 300, 400, 300, 300, 200, 200, 400, 300, 300, 300, 300, 300, 400, 300, 300, 200, 200, 300, 200, 200, 200, 400, 300, 400, 300, 300, 200, 200, 400

    # Configurações padrão
instrumento: .word 0
volume:      .word 127
num_notas1:  .word 25
num_notas2:  .word 14
num_notas3:  .word 18
num_notas4:  .word 61
num_notas5:  .word 82

    # Mensagens
menu_msg: .asciiz "\nEscolha uma opção:\n1. Tocar 'Parabéns pra Você'\n2. Tocar 'Brilha Brilha'\n3. Tocar 'Do ré mi fá'\n4. Tocar 'Baby Shark'\n5. Tocar 'Meu Pintinho Amarelinho'\n6. Playlist\n7. Sair\n"
escolha_msg: .asciiz "Digite o número da opção: "
repetir_msg: .asciiz "\nRepetir música? (1 = Sim, 0 = Não): "
invalido_msg: .asciiz "\nOpção inválida! Tente novamente.\n"
saindo_msg: .asciiz "\nSaindo...\n"
tocando_msg: .asciiz "Iniciando música "

playlist_menu_msg: .asciiz "\nPlaylist:\n1. Adicionar 'Parabéns pra Você'\n2. Adicionar 'Brilha Brilha'\n3. Adicionar 'Do ré mi fá'\n4. Adicionar 'Baby Shark'\n5. Adicionar 'Meu Pintinho Amarelinho'\n6. Tocar Playlist\n7. Voltar\n"
playlist_choice_msg: .asciiz "Digite a opção da playlist: "
playlist_msg: .asciiz "\nPlaylist vazia ou cheia!\n"
repeat_playlist_msg: .asciiz "\nRepetir playlist? (1 = Sim, 0 = Não): "
new_playlist_msg: .asciiz "\nMontar nova playlist? (1 = Sim, 0 = Sair): "
newline: .asciiz "\n"

    # Variáveis para a playlist (limitada a 10 músicas)
    .align 2
playlist: .space 40   # 10 palavras = 40 bytes
    .align 2
playlistCount: .word 0

.text
.globl main

#------------------- Main Menu -------------------
main:
menu_loop:
    jal exibir_menu       # Exibe o menu principal
    jal ler_escolha       # Lê a opção do usuário
    move $t0, $v0        # $t0 = opção escolhida

    # Verifica a opção digitada
    li   $t7, 1
    beq  $t0, $t7, tocar_musica1
    li   $t7, 2
    beq  $t0, $t7, tocar_musica2
    li   $t7, 3
    beq  $t0, $t7, tocar_musica3
    li   $t7, 4
    beq  $t0, $t7, tocar_musica4
    li   $t7, 5
    beq  $t0, $t7, tocar_musica5
    li   $t7, 6
    beq  $t0, $t7, playlist_menu
    li   $t7, 7
    beq  $t0, $t7, sair
    # Se opção inválida:
    li   $v0, 4
    la   $a0, invalido_msg
    syscall
    j    menu_loop

#------------------- Opções de Reprodução Individual -------------------
tocar_musica1:
    la $a0, notas1
    la $a1, duracoes1
    lw $a2, num_notas1
    jal tocar_musica
    j menu_loop

tocar_musica2:
    la $a0, notas2
    la $a1, duracoes2
    lw $a2, num_notas2
    jal tocar_musica
    j menu_loop

tocar_musica3:
    la $a0, notas3
    la $a1, duracoes3
    lw $a2, num_notas3
    jal tocar_musica
    j menu_loop

tocar_musica4:
    la $a0, notas4
    la $a1, duracoes4
    lw $a2, num_notas4
    jal tocar_musica
    j menu_loop

tocar_musica5:
    la $a0, notas5
    la $a1, duracoes5
    lw $a2, num_notas5
    jal tocar_musica
    j menu_loop

sair:
    li $v0, 4
    la $a0, saindo_msg
    syscall
    li $v0, 10
    syscall

#------------------- Funções de Menu e Leitura -------------------
exibir_menu:
    li $v0, 4
    la $a0, menu_msg
    syscall
    jr $ra

ler_escolha:
    li $v0, 4
    la $a0, escolha_msg
    syscall
    li $v0, 5
    syscall
    jr $ra

#------------------- Função para Tocar Música (com opção de repetir) -------------------
tocar_musica:
    # Salva os ponteiros e o contador original
    move $s0, $a0   # $s0 = endereço do vetor de notas original
    move $s1, $a1   # $s1 = endereço do vetor de durações original
    move $s2, $a2   # $s2 = número original de notas
play_again:
    # Reinicia os ponteiros
    move $t0, $s0   # $t0 = notas
    move $t1, $s1   # $t1 = durações
    move $t2, $s2   # $t2 = contador de notas
play_loop:
    lw $a0, 0($t0)      # Carrega a nota
    lw $a1, 0($t1)      # Carrega a duração
    lw $a2, instrumento # Carrega o instrumento
    lw $a3, volume      # Carrega o volume
    li $v0, 31          # Syscall para tocar a nota
    syscall
    li $v0, 32          # Syscall para pausar (delay)
    lw $a0, 0($t1)      # Duração da pausa
    syscall
    addi $t0, $t0, 4    # Próxima nota
    addi $t1, $t1, 4    # Próxima duração
    addi $t2, $t2, -1   # Decrementa contador
    bnez $t2, play_loop
    # Após tocar, pergunta se repete a música
    li $v0, 4
    la $a0, repetir_msg
    syscall
    li $v0, 5
    syscall
    move $t3, $v0      # $t3 = resposta (1 = Sim, 0 = Não)
    bnez $t3, play_again
    jr $ra

#------------------- Menu de Playlist -------------------
playlist_menu:
playlist_menu_loop:
    li $v0, 4
    la $a0, playlist_menu_msg
    syscall
    li $v0, 4
    la $a0, playlist_choice_msg
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # opção da playlist
    li $t7, 1
    beq $t0, $t7, add_playlist_song1
    li $t7, 2
    beq $t0, $t7, add_playlist_song2
    li $t7, 3
    beq $t0, $t7, add_playlist_song3
    li $t7, 4
    beq $t0, $t7, add_playlist_song4
    li $t7, 5
    beq $t0, $t7, add_playlist_song5
    li $t7, 6
    beq $t0, $t7, play_playlist_list
    li $t7, 7
    beq $t0, $t7, menu_loop
    li $v0, 4
    la $a0, invalido_msg
    syscall
    j playlist_menu_loop

# Procedimento para adicionar uma música à playlist
# Recebe em $a0 o ID da música (1 a 5)
add_to_playlist:
    lw $t1, playlistCount      # Número atual de músicas na playlist
    li $t2, 10                 # Limite máximo (10)
    bge $t1, $t2, playlist_full
    la $t0, playlist           # Endereço base da playlist
    sll $t3, $t1, 2            # Offset = contador * 4
    add $t0, $t0, $t3          # Endereço de armazenamento
    sw $a0, 0($t0)             # Armazena o ID da música
    addi $t1, $t1, 1
    sw $t1, playlistCount      # Atualiza o contador
    jr $ra

playlist_full:
    li $v0, 4
    la $a0, playlist_msg      # Mensagem de playlist cheia
    syscall
    jr $ra

add_playlist_song1:
    li $a0, 1
    jal add_to_playlist
    j playlist_menu_loop

add_playlist_song2:
    li $a0, 2
    jal add_to_playlist
    j playlist_menu_loop

add_playlist_song3:
    li $a0, 3
    jal add_to_playlist
    j playlist_menu_loop

add_playlist_song4:
    li $a0, 4
    jal add_to_playlist
    j playlist_menu_loop

add_playlist_song5:
    li $a0, 5
    jal add_to_playlist
    j playlist_menu_loop

#------------------- Reprodução da Playlist -------------------
play_playlist_list:
    lw $t0, playlistCount     # Total de músicas na playlist
    beqz $t0, playlist_empty  # Se não houver, mostra mensagem
    li $s3, 0                # Usamos $s3 para o índice da playlist
playlist_loop:
    lw $t2, playlistCount     # Total atual
    beq  $s3, $t2, end_playlist
    la $t3, playlist
    sll $t4, $s3, 2           # Offset = índice * 4
    add $t3, $t3, $t4         # Endereço do elemento
    lw $t5, 0($t3)           # $t5 = ID da música

    # Exibe mensagem: "Tocando música <posição> iniciando"
    li $v0, 4
    la $a0, tocando_msg
    syscall
    addi $t6, $s3, 1         # posição = índice + 1
    li $v0, 1
    move $a0, $t6
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    # Seleciona a música com base no ID e toca (simples, sem repetir)
    li $t7, 1
    beq  $t5, $t7, play_song1_simple
    li $t7, 2
    beq  $t5, $t7, play_song2_simple
    li $t7, 3
    beq  $t5, $t7, play_song3_simple
    li $t7, 4
    beq  $t5, $t7, play_song4_simple
    li $t7, 5
    beq  $t5, $t7, play_song5_simple
    j next_song_playlist

play_song1_simple:
    la $a0, notas1
    la $a1, duracoes1
    lw $a2, num_notas1
    jal tocar_musica_simples
    j next_song_playlist

play_song2_simple:
    la $a0, notas2
    la $a1, duracoes2
    lw $a2, num_notas2
    jal tocar_musica_simples
    j next_song_playlist

play_song3_simple:
    la $a0, notas3
    la $a1, duracoes3
    lw $a2, num_notas3
    jal tocar_musica_simples
    j next_song_playlist

play_song4_simple:
    la $a0, notas4
    la $a1, duracoes4
    lw $a2, num_notas4
    jal tocar_musica_simples
    j next_song_playlist

play_song5_simple:
    la $a0, notas5
    la $a1, duracoes5
    lw $a2, num_notas5
    jal tocar_musica_simples

next_song_playlist:
    addi $s3, $s3, 1         # Incrementa o índice (armazenado em $s3)
    j playlist_loop

end_playlist:
    # Fim da reprodução da playlist
    li $v0, 4
    la $a0, repeat_playlist_msg
    syscall
    li $v0, 5
    syscall
    move $t8, $v0           # Resposta para repetir
    bnez $t8, repeat_playlist   # Se resposta != 0, repete a playlist
    # Se não repetir, pergunta se deseja montar nova playlist ou sair
    li $v0, 4
    la $a0, new_playlist_msg
    syscall
    li $v0, 5
    syscall
    move $t9, $v0
    bnez $t9, playlist_menu    # Se resposta != 0, volta para montar a playlist
    j sair           # Caso contrário, sai do programa

repeat_playlist:
    j play_playlist_list

playlist_empty:
    li $v0, 4
    la $a0, playlist_msg
    syscall
    jr $ra

#------------------- Função para Tocar Música de Forma Simples (sem repetir) -------------------
tocar_musica_simples:
    move $s0, $a0   # endereço do vetor de notas
    move $s1, $a1   # endereço do vetor de durações
    move $s2, $a2   # número de notas
    move $t0, $s0   # ponteiro para notas
    move $t1, $s1   # ponteiro para durações
    move $t2, $s2   # contador de notas
simple_loop:
    beqz $t2, simple_end
    lw $a0, 0($t0)      # carrega a nota
    lw $a1, 0($t1)      # carrega a duração
    lw $a2, instrumento # carrega o instrumento
    lw $a3, volume      # carrega o volume
    li $v0, 31         # syscall para tocar a nota
    syscall
    li $v0, 32         # syscall para delay
    lw $a0, 0($t1)
    syscall
    addi $t0, $t0, 4
    addi $t1, $t1, 4
    addi $t2, $t2, -1
    j simple_loop
simple_end:
    jr $ra

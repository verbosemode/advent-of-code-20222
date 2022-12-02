let part1_test_input =
  {|1000
2000
3000

4000

5000
6000

7000
8000
9000

10000|}

let part1_test_output =
  [ [ 2000; 3000 ]; [ 4000 ]; [ 5000; 6000 ]; [ 7000; 8000; 9000 ]; [ 10000 ] ]

let find_most_callories l =
  List.fold_left
    (fun a e ->
      let callories = List.fold_left (fun a' e' -> a' + e') 0 e in
      if callories > a then callories else a)
    0 l

let parse_elves l =
  let rec aux l a elves =
    match l with
    | [] -> a :: elves
    | h :: t ->
        if String.length h = 0 then aux t [] (a :: elves)
        else aux t (int_of_string h :: a) elves
  in
  aux l [] []

let part1 filename =
  In_channel.with_open_text filename In_channel.input_all
  |> String.split_on_char '\n'
  |> parse_elves
  |> find_most_callories

let () = part1 Sys.argv.(1) |> print_int

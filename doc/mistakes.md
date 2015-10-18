Mistakes in Handwritten Code
---

15/10/14 - Structure::LinkedList#index
- did not advance pointer in loop
- returned data at found node instead of index value
- did not catch out-of-bounds when trying to access highest index + 1
- did not handle case when list empty

17/10/14 - Structure::LinkedList#delete
- forgot comma in syntax for `fail`: `fail error_class, message`
- did not catch out-of-bounds when deleting highest index + 1
- did not handle case when list empty

17/10/14 - Structure::LinkedList#pop
- did not handle case when list empty

# Displaying a Double Linked List

We can use the following steps to display the elements of a double linked list...

```
Step 1 - Check whether list is Empty (head == NULL)
Step 2 - If it is Empty, then display 'List is Empty!!!' and terminate the function.
Step 3 - If it is not Empty, then define a Node pointer 'temp' and initialize with head.
Step 4 - Display 'NULL <--- '.
Step 5 - Keep displaying temp → data with an arrow (<===>) until temp reaches to the last node
Step 6 - Finally, display temp → data with arrow pointing to NULL (temp → data ---> NULL).
```

---

Another approach

# Here is an algorithm to traverse a doubly linked list:

```
STEP 1: Initialize a pointer to the head node of the linked list.
STEP 2: Traverse the linked list while the pointer is not NULL.
STEP 3: In each iteration, read the data of the current node and move the pointer to the next node.
STEP 4: At the end of the loop, the pointer will point to the last node of the linked list.
```

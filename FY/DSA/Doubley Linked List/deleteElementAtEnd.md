# Deleting from End of the list

We can use the following steps to delete a node from end of the double linked list...

```
Step 1 - Check whether list is Empty (head == NULL)
Step 2 - If it is Empty, then display 'List is Empty!!! Deletion is not possible' and terminate the function.
Step 3 - If it is not Empty then, define a Node pointer 'temp' and initialize with head.
Step 4 - Check whether list has only one Node (temp → previous and temp → next both are NULL)
Step 5 - If it is TRUE, then assign NULL to head and delete temp. And terminate from the function. (Setting Empty list condition)
Step 6 - If it is FALSE, then keep moving temp until it reaches to the last node in the list. (until temp → next is equal to NULL)
Step 7 - Assign NULL to temp → previous → next and delete temp.
```

---

Another approach

# Here is an algorithm to delete an element at the end of a doubly linked list:

```
STEP 1 : Start traversing the linked list from the last node
STEP 2 : Make the second last node the new last node
STEP 3 : Make the second last node's next pointer point to NULL
STEP 4 : Free the memory occupied by the node to be
```

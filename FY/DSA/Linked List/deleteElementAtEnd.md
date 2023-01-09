# Deleting from End of the list

We can use the following steps to delete a node from end of the single linked list...

```
Step 1 - Check whether list is Empty (head == NULL)
Step 2 - If it is Empty then, display 'List is Empty!!! Deletion is not possible' and terminate the function.
Step 3 - If it is Not Empty then, define two Node pointers 'temp1' and 'temp2' and initialize 'temp1' with head.
Step 4 - Check whether list has only one Node (temp1 → next == NULL)
Step 5 - If it is TRUE. Then, set head = NULL and delete temp1. And terminate the function. (Setting Empty list condition)
Step 6 - If it is FALSE. Then, set 'temp2 = temp1 ' and move temp1 to its next node. Repeat the same until it reaches to the last node in the list. (until temp1 → next == NULL)
Step 7 - Finally, Set temp2 → next = NULL and delete temp1.
```

---

Another approach

# Here is an algorithm to delete an element at the end of a linked list:

```
STEP 1 : Start traversing the linked list from the last node
STEP 2 : Make the second last node the new last node
STEP 3 : Make the second last node's next pointer point to NULL
STEP 4 : Free the memory occupied by the node to be
```

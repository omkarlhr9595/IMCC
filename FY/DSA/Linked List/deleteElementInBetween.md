# Deleting a Specific Node from the list

We can use the following steps to delete a specific node from the single linked list...

```
Step 1 - Check whether list is Empty (head == NULL)
Step 2 - If it is Empty then, display 'List is Empty!!! Deletion is not possible' and terminate the function.
Step 3 - If it is Not Empty then, define two Node pointers 'temp1' and 'temp2' and initialize 'temp1' with head.
Step 4 - Keep moving the temp1 until it reaches to the exact node to be deleted or to the last node. And every time set 'temp2 = temp1' before moving the 'temp1' to its next node.
Step 5 - If it is reached to the last node then display 'Given node not found in the list! Deletion not possible!!!'. And terminate the function.
Step 6 - If it is reached to the exact node which we want to delete, then check whether list is having only one node or not
Step 7 - If list has only one node and that is the node to be deleted, then set head = NULL and delete temp1 (free(temp1)).
Step 8 - If list contains multiple nodes, then check whether temp1 is the first node in the list (temp1 == head).
Step 9 - If temp1 is the first node then move the head to the next node (head = head → next) and delete temp1.
Step 10 - If temp1 is not first node then check whether it is last node in the list (temp1 → next == NULL).
Step 11 - If temp1 is last node then set temp2 → next = NULL and delete temp1 (free(temp1)).
Step 12 - If temp1 is not first node and not last node then set temp2 → next = temp1 → next and delete temp1 (free(temp1)).
```

---

Another approach

# Here is an algorithm to delete an element at any position in a linked list:

```
STEP 1 : Start traversing the linked list from the head node.
STEP 2 : If the position of the element to be deleted is 1, make the second node the new head node.
STEP 3 : Otherwise, make the node before the node to be deleted point to the node after the node to be deleted.
STEP 4 : Free the memory occupied by the node to be deleted.
STEP 5 : Decrement the size of the linked list by one.
```

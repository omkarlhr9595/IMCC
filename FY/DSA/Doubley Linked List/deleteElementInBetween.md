# Deleting a Specific Node from the list

We can use the following steps to delete a specific node from the double linked list...

```
Step 1 - Check whether list is Empty (head == NULL)
Step 2 - If it is Empty then, display 'List is Empty!!! Deletion is not possible' and terminate the function.
Step 3 - If it is not Empty, then define a Node pointer 'temp' and initialize with head.
Step 4 - Keep moving the temp until it reaches to the exact node to be deleted or to the last node.
Step 5 - If it is reached to the last node, then display 'Given node not found in the list! Deletion not possible!!!' and terminate the fuction.
Step 6 - If it is reached to the exact node which we want to delete, then check whether list is having only one node or not
Step 7 - If list has only one node and that is the node which is to be deleted then set head to NULL and delete temp (free(temp)).
Step 8 - If list contains multiple nodes, then check whether temp is the first node in the list (temp == head).
Step 9 - If temp is the first node, then move the head to the next node (head = head → next), set head of previous to NULL (head → previous = NULL) and delete temp.
Step 10 - If temp is not the first node, then check whether it is the last node in the list (temp → next == NULL).
Step 11 - If temp is the last node then set temp of previous of next to NULL (temp → previous → next = NULL) and delete temp (free(temp)).
Step 12 - If temp is not the first node and not the last node, then set temp of previous of next to temp of next (temp → previous → next = temp → next), temp of next of previous to temp of previous (temp → next → previous = temp → previous) and delete temp (free(temp)).
```

---

Anther approach

# Here is an algorithm to delete an element at any position in a doubly linked list:

```
STEP 1 : Start traversing the linked list from the head node.
STEP 2 : If the position of the element to be deleted is 1, make the second node the new head node.
STEP 3 : Otherwise, make the node before the node to be deleted point to the node after the node to be deleted.
STEP 4 : Free the memory occupied by the node to be deleted.
STEP 5 : Decrement the size of the linked list by one.
```

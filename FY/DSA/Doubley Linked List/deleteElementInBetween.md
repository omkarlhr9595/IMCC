# Here is an algorithm to delete an element at any position in a doubly linked list:

```
STEP 1 : Start traversing the linked list from the head node.
STEP 2 : If the position of the element to be deleted is 1, make the second node the new head node.
STEP 3 : Otherwise, make the node before the node to be deleted point to the node after the node to be deleted.
STEP 4 : Free the memory occupied by the node to be deleted.
STEP 5 : Decrement the size of the linked list by one.
```

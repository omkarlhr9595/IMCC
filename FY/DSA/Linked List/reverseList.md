# Here is an algorithm to reverse a linked list:

```
STEP 1 : Initialize three pointers prev, curr and next to NULL.
STEP 2 : Set curr to the head node of the linked list.
STEP 3 : Traverse the linked list and in a loop, do the following:
a. Store the next node in the pointer next
b. Make the current node point to the previous node
c. Move the prev and curr pointers one node ahead
STEP 4 : At the end, make the head pointer point to the last node of the reversed linked list.
```

# Deleting from Beginning of the list

We can use the following steps to delete a node from beginning of the double linked list...

```
Step 1 - Check whether list is Empty (head == NULL)
Step 2 - If it is Empty then, display 'List is Empty!!! Deletion is not possible' and terminate the function.
Step 3 - If it is not Empty then, define a Node pointer 'temp' and initialize with head.
Step 4 - Check whether list is having only one node (temp → previous is equal to temp → next)
Step 5 - If it is TRUE, then set head to NULL and delete temp (Setting Empty list conditions)
Step 6 - If it is FALSE, then assign temp → next to head, NULL to head → previous and delete temp.
```

---

Another Approach

# Here is an algorithm to delete an element at the beginning of a doubly linked list:

```
STEP 1 : Start traversing the linked list from the head node
STEP 2 : Make the second node the new head node
STEP 3 : Make the second node's previous pointer point to NULL
STEP 4 : Free the memory occupied by the node to be deleted
STEP 5 : Decrement the size of the linked list by one.


```

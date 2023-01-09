# Here is an algorithm to add an element at the end of a linked list:

```
STEP 1 : Create a new node with the data to be inserted
STEP 2 : Make the new node's next pointer point to NULL.
STEP 3 : Make the last node's next pointer point to the new node.
STEP 4 : Make the new node's previous pointer point to the last node.
STEP 5 : Make the new node the last node.
STEP 6 : Increment the size of the linked list by one.
```

# Inserting At End of the list

We can use the following steps to insert a new node at end of the single linked list...

```
Step 1 - Create a newNode with given value and newNode → next as NULL.
Step 2 - Check whether list is Empty (head == NULL).
Step 3 - If it is Empty then, set head = newNode.
Step 4 - If it is Not Empty then, define a node pointer temp and initialize with head.
Step 5 - Keep moving the temp to its next node until it reaches to the last node in the list (until temp → next is equal to NULL).
Step 6 - Set temp → next = newNode.
```

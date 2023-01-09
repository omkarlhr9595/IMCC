# Inserting element at the beginning of list

```
STEP 1 : initialize head = null
STEP 2 : if head == null then assign new node to head (creating first node)
STEP 3 : else create a newNode,
              assign newNode->next = head
                    head = newNode
```

# Inserting At Beginning of the list

We can use the following steps to insert a new node at beginning of the single linked list...

```
Step 1 - Create a newNode with given value.
Step 2 - Check whether list is Empty (head == NULL)
Step 3 - If it is Empty then, set newNode→next = NULL and head = newNode.
Step 4 - If it is Not Empty then, set newNode→next = head and head = newNode.
```

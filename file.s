.global get
.global write
.global make
.global delete
.global Int-To-Str
.func get
.func write
.func make
.func delete
.func Int-To-Str

get:
    PUSH {LR} @ Push the Link Register to the Stack for the Program Counter later
    STMFD SP!, {R4-R12} @ Save R4-R12 to comply to function standards
    @ gets the content of a file
    @ Input - R0 - Filename address
    @ Input - R1 - Address for content output
    @ Output - R0 - Completion code (for errors)
    LDMFD SP!, {R4-R12} @ Retore R4-R12 once done execution
    POP {PC} @ Pop the Link Register onto the Program Counter

write:
    PUSH {LR} @ Push the Link Register to the Stack for the Program Counter later
    STMFD SP!, {R4-R12} @ Save R4-R12 to comply to function standards
    @ Overwrites the contents of a file
    @ Input - R0 - Filename address
    @ Input - R1 - Content input address
    @ Output - R0 - Completion code (for errors)
    LDMFD SP!, {R4-R12} @ Retore R4-R12 once done execution
    POP {PC} @ Pop the Link Register onto the Program Counter

make:
    PUSH {LR} @ Push the Link Register to the Stack for the Program Counter later
    STMFD SP!, {R4-R12} @ Save R4-R12 to comply to function standards
    @ Makes an Empty File
    @ Input - R0 - Filename address
    @ Output - R0 - Completion code (for errors)
    LDMFD SP!, {R4-R12} @ Retore R4-R12 once done execution
    POP {PC} @ Pop the Link Register onto the Program Counter

delete:
    PUSH {LR} @ Push the Link Register to the Stack for the Program Counter later
    STMFD SP!, {R4-R12} @ Save R4-R12 to comply to function standards
    @ Deletes
    @ Input - R0 - Filename address
    @ Output - R0 - Completion code (for errors)
    LDMFD SP!, {R4-R12} @ Retore R4-R12 once done execution
    POP {PC} @ Pop the Link Register onto the Program Counter

Int-To-Str:
    PUSH {LR} @ Push the Link Register to the Stack for the Program Counter later
    STMFD SP!, {R4-R12} @ Save R4-R12 to comply to function standards
    @ Converts an Integer to an .ascii String
    @ Input - R0 - Integer for conversion
    @ Input - R1 - Address for .ascii output
    @ Output - R0 - Completion code (for errors)
    LDMFD SP!, {R4-R12} @ Retore R4-R12 once done execution
    POP {PC} @ Pop the Link Register onto the Program Counter

Str-To-Int:
    PUSH {LR} @ Push the Link Register to the Stack for the Program Counter later
    STMFD SP!, {R4-R12} @ Save R4-R12 to comply to function standards
    @ Converts an .ascii String to a String
    @ Input - R0 - Address of .ascii string for conversion
    @ Output - R0 - Completion code (for errors)
    @ Output - R1 - Integer Output
    LDMFD SP!, {R4-R12} @ Retore R4-R12 once done execution
    POP {PC} @ Pop the Link Register onto the Program Counter

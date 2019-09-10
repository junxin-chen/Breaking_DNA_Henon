
function x=DNA_enc_withrule(index,rule)
switch rule
    case 1
        switch index
            case 0
                x='A';
            case 1
                x='G';
            case 2
                x='C';
            case 3
                x='T';
            otherwise 
                display('index error when DNA encoding')
        end
    case 2
        switch index
            case 0
                x='A';
            case 1
                x='C';
            case 2
                x='G';
            case 3
                x='T';
             otherwise 
                display('index error when DNA encoding')               
        end
    case 3
        switch index
            case 0
                x='T';
            case 1
                x='G';
            case 2
                x='C';
            case 3
                x='A';
            otherwise 
                display('index error when DNA encoding')
        end      
    case 4
        switch index
            case 0
                x='T';
            case 1
                x='C';
            case 2
                x='G';
            case 3
                x='A';
            otherwise 
                display('index error when DNA encoding')
        end     

     case 5
        switch index
            case 0
                x='C';
            case 1
                x='T';
            case 2
                x='A';
            case 3
                x='G';
            otherwise 
                display('index error when DNA encoding')
        end          
     case 6
        switch index
            case 0
                x='C';
            case 1
                x='A';
            case 2
                x='T';
            case 3
                x='G';
            otherwise 
                display('index error when DNA encoding')
        end          
            
     case 7
        switch index
            case 0
                x='G';
            case 1
                x='T';
            case 2
                x='A';
            case 3
                x='C';
            otherwise 
                display('index error when DNA encoding')
        end           
        
        case 8
        switch index
            case 0
                x='G';
            case 1
                x='A';
            case 2
                x='T';
            case 3
                x='C';
            otherwise 
                display('index error when DNA encoding')
        end
    otherwise
        display('rule error when DNA encoding')         
end

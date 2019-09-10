
function index=DNA_dec_withrule(x,rule)
switch rule
    case 1
        switch x
            case 'A'
                index=0;
            case 'T'
                index=3;
            case 'C'
                index=2;
            case 'G'
                index=1;
            otherwise 
                display('index error when DNA decoding')
        end

    case 2
        switch x
            case 'A'
                index=0;
            case 'T'
                index=3;
            case 'C'
                index=1;
            case 'G'
                index=2;
            otherwise 
                display('index error when DNA decoding')
        end    
        
     case 3
        switch x
            case 'A'
                index=3;
            case 'T'
                index=0;
            case 'C'
                index=2;
            case 'G'
                index=1;
            otherwise 
                display('index error when DNA decoding')
        end    
    case 4
        switch x
            case 'A'
                index=3;
            case 'T'
                index=0;
            case 'C'
                index=1;
            case 'G'
                index=2;
            otherwise 
                display('index error when DNA decoding')
        end            
   
    case 5
        switch x
            case 'A'
                index=2;
            case 'T'
                index=1;
            case 'C'
                index=0;
            case 'G'
                index=3;
            otherwise 
                display('index error when DNA decoding')
        end            
    case 6
        switch x
            case 'A'
                index=1;
            case 'T'
                index=2;
            case 'C'
                index=0;
            case 'G'
                index=3;
            otherwise 
                display('index error when DNA decoding')
        end       
    case 7
        switch x
            case 'A'
                index=2;
            case 'T'
                index=1;
            case 'C'
                index=3;
            case 'G'
                index=0;
            otherwise 
                display('index error when DNA decoding')
        end        
     case 8
        switch x
            case 'A'
                index=1;
            case 'T'
                index=2;
            case 'C'
                index=3;
            case 'G'
                index=0;
            otherwise 
                display('index error when DNA decoding')
        end  
        
    otherwise
        display('rule error when DNA decoding')         
end

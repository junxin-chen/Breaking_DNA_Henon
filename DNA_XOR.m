% Lan' cipher Signal Processing 147 (2018) 133¨C145


function x=DNA_XOR(y,z)
switch y
    case 'A'
        x=z;
    case 'T'
        if z=='A'
            x='T';
        else if z=='T'
                x='A';
            else if z=='C'
                    x='G';
                else if z=='G'
                        x='C';
                    end
                end
            end
        end
    case 'C'
        if z=='A'
            x='C';
        else if z=='T'
                x='G';
            else if z=='C'
                    x='A';
                else if z=='G'
                        x='T';
                    end
                end
            end
        end
    case 'G'
        if z=='A'
            x='G';
        else if z=='T'
                x='C';
            else if z=='C'
                    x='T';
                else if z=='G'
                        x='A';
                    end
                end
            end
        end
end 
end



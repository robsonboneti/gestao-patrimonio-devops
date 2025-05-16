CREATE TABLE IF NOT EXISTS categorias (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS locais (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS fornecedores (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(50) NOT NULL UNIQUE,
    observacoes VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS classificacoes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(50) NOT NULL UNIQUE,
    ordem INT UNIQUE,
    observacoes VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS responsaveis (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(50) NOT NULL UNIQUE,
    observacoes VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tipos_anexo (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(50) NOT NULL UNIQUE,
    observacoes VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS entidades (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS anexos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_entidade UUID NOT NULL,
    nome VARCHAR(50) NOT NULL,
    url VARCHAR(255) NOT NULL,
    id_tipo_anexo UUID NOT NULL,
    observacoes VARCHAR(255),
    FOREIGN KEY (id_tipo_anexo) REFERENCES tipos_anexo(id)
);

CREATE TABLE IF NOT EXISTS inventario (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(50) NOT NULL,
    id_categoria UUID NOT NULL,
    quantidade INT NOT NULL,
    id_local UUID NOT NULL,
    data_aquisicao DATE,
    valor_estimado DECIMAL,
    id_fornecedor UUID,
    id_classificacao UUID NOT NULL,
    id_responsavel UUID,
    observacoes VARCHAR(255),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id),
    FOREIGN KEY (id_local) REFERENCES locais(id),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id),
    FOREIGN KEY (id_classificacao) REFERENCES classificacoes(id),
    FOREIGN KEY (id_responsavel) REFERENCES responsaveis(id)
);